create database GestMove 
Go 
use GestMove
Go 
create table Region (
IdRegion  int constraint PK_Region primary key ,
NomRegion varchar(30)
)
GO

create table Academie (
IdAcademie int Constraint PK_Academie Primary key ,
NomAcademie varchar(30),
IdRegion int constraint FK_Academie_Region Foreign key (IdRegion) references Region(IdRegion),
)
GO
create table Lycee (
IdLycee int Constraint PK_Lycee Primary key ,
NomLycee varchar(30),
Ville varchar(30),
IdAcademie  int constraint FK_Lycee_Academie  Foreign key(IdAcademie) references Academie(IdAcademie),
)
GO

create table Professeur (
IdProfesseur int Constraint PK_Professeur Primary key ,
Nom varchar(30),
Prenom varchar(30),
DateN date ,
Email varchar(100),
Pass varchar(40),
DateAffLycee date ,
EtatCivil varchar(20),
NEnfant int ,
IdLycee  int constraint FK_Professeur_Lycee Foreign key(IdLycee) references Lycee(IdLycee)
)
GO

create table Demande (
IdDemande int Constraint PK_Demande Primary key ,
DateDem date,
IdProfesseur int constraint FK_Demande_Professeur Foreign key (IdProfesseur) references Professeur(IdProfesseur)
)
Go
create table Detail_Demande(
IdDemande int constraint FK_Detail_Demande_Demande Foreign key (IdDemande) references Demande(IdDemande),
IdLycee int constraint FK_Detail_Demande_Lycee Foreign key(IdLycee) references Lycee(IdLycee),
NumOrdre int ,
constraint PK_Detail_Demande Primary key(IdDemande,IdLycee)
)
GO 
-- Trigger / da3wa mrawna chwia hna 
create trigger TG_MemeLycee_Demande on  Detail_Demande 
instead of Insert ,update
as 
begin 
declare @x varchar(30)  ;
set @x =( select IdLycee from Professeur where IdProfesseur = (SELECT top 1 dbo.Demande.IdProfesseur
FROM   dbo.Detail_Demande INNER JOIN
                      dbo.Demande ON dbo.Detail_Demande.IdDemande = dbo.Demande.IdDemande
					   where dbo.Demande.IdDemande = (select IdDemande from inserted)));
					  
if((select count(*) from inserted where IdLycee = @x) > 0)
begin
 RAISERROR('impossible de choisir lycée Actuel De Professeur , veuillez sélectionner un autre Lycée', 16, 1);
end
else 
begin 
	if((select count(*) from deleted) > 0) 
		begin
		UPDATE Detail_Demande
	  SET [IdDemande] = I.IdDemande
	  ,[IdLycee] = I.IdLycee
      ,[NumOrdre] = I.NumOrdre
		 from inserted I where [Detail_Demande].IdDemande = I.IdDemande and  [Detail_Demande].[IdLycee] = I.IdLycee
		End
		else
		Begin
insert into Detail_Demande select *from inserted
		End
end
End
-- End trigger 

-- 3 function 
GO
CREATE FUNCTION Calculer_Points
(
	@IdProf int 
)
RETURNS int
AS
BEGIN
declare @num int;
declare @dateAff date ;
declare @NombreAnn int ;
set @dateAff = (select  DateAffLycee from Professeur where IdProfesseur= @IdProf);
set @NombreAnn = (select DATEDIFF(YEAR,@dateAff,GETDATE())); 
set @num = (@NombreAnn * 2) + (select NEnfant from Professeur where IdProfesseur= @IdProf);
	-- Return the result of the function
	RETURN @num
END
GO
select dbo.Calculer_Points(1)
--- 4 Procedure stocke Top 1 ville dans une region 
GO
create procedure Get_TopVilleMutationParRegion @Region int 
as 
begin 
select * from  dbo.Lycee where  dbo.Lycee.IdLycee = (SELECT  top 1 dbo.Lycee.IdLycee
FROM   dbo.Detail_Demande INNER JOIN
                      dbo.Lycee ON dbo.Detail_Demande.IdLycee = dbo.Lycee.IdLycee INNER JOIN
                      dbo.Academie ON dbo.Lycee.IdAcademie = dbo.Academie.IdAcademie INNER JOIN
                      dbo.Region ON dbo.Academie.IdRegion = dbo.Region.IdRegion 
					  where dbo.Region.IdRegion = @Region
					  group by dbo.Lycee.IdLycee
					  order by count(dbo.Lycee.IdLycee))
		
End 
GO
exec Get_TopVilleMutationParRegion 1
-- 5 afficher les prof professeurs qui demande des lycées qui se trouvent à.|'extérieur de leur région
GO
create procedure Get_prof_Autre_Region 
as begin 
select distinct P.* from Professeur P inner join Demande D on D.IdProfesseur = P.IdProfesseur inner join Detail_Demande  DD on D.IdDemande =DD.IdDemande 
 where 
 (SELECT count(distinct dbo.Region.IdRegion)
FROM         dbo.Detail_Demande INNER JOIN
                      dbo.Demande ON dbo.Detail_Demande.IdDemande = dbo.Demande.IdDemande INNER JOIN
                      dbo.Lycee ON dbo.Detail_Demande.IdLycee = dbo.Lycee.IdLycee INNER JOIN
                      dbo.Academie ON dbo.Lycee.IdAcademie = dbo.Academie.IdAcademie INNER JOIN
                      dbo.Region ON dbo.Academie.IdRegion = dbo.Region.IdRegion
					  where dbo.Demande.IdProfesseur = P.IdProfesseur
					  ) >= 2
end 
GO
exec Get_prof_Autre_Region 
GO
-- 6 un trigger qui emoêche la saisie d'un professeur célibataire avec un nombre d'enfants différent de zéro.
GO
create trigger Prof_Enfant_Celibataire on Professeur 
instead of insert , update 
as
begin
declare @num int ;
declare @etat varchar(30) ;
select @num=NEnfant, @etat=EtatCivil from inserted;
	if(@etat = 'Celibataire' and @num > 0) 
	begin 
	RAISERROR('Le nombre d enfant est supperieur a 0 , le Prof est celibataire , Logic !!!! ',16,1);
	end else 
	begin 
		if((select count(*) from deleted) > 0) 
		begin
	UPDATE [dbo].[Professeur]
   SET [IdProfesseur] = I.IdProfesseur
      ,[Nom] = I.Nom
      ,[Prenom] = I.Prenom
      ,[DateN] = I.DateN
      ,[Email] = I.Email
      ,[Pass] = I.Pass
      ,[DateAffLycee] = I.DateAffLycee
      ,[EtatCivil] = I.EtatCivil
      ,[NEnfant] = I.NEnfant
      ,[IdLycee] = I.IdLycee
	   from inserted I where I.IdProfesseur = [Professeur].IdProfesseur
		end
		else begin 
		insert into Professeur select * from inserted 
		end
	end
end 
GO
-- Dossier 2 
-- 3 Créer un formulaire de consultation qui permet, pour un lycée choisi ..
        select P.* from Professeur P where '2' in (SELECT Lycee.IdLycee  FROM         dbo.Detail_Demande INNER JOIN
                      dbo.Demande ON dbo.Detail_Demande.IdDemande = dbo.Demande.IdDemande INNER JOIN
                      dbo.Lycee ON dbo.Detail_Demande.IdLycee = dbo.Lycee.IdLycee
					  where Demande.IdProfesseur =P.IdProfesseur
					  ) 
-- 4 Créer un formulaire quiaffiche dans une grille la liste des 10lycées les plus demandés ..
SELECT Top 10   Lycee.*, count(Lycee.IdLycee) as [Nombre Mutation]
FROM         dbo.Detail_Demande INNER JOIN
                      dbo.Lycee ON dbo.Detail_Demande.IdLycee = dbo.Lycee.IdLycee INNER JOIN
                      dbo.Academie ON dbo.Lycee.IdAcademie = dbo.Academie.IdAcademie
where dbo.Academie.IdAcademie = '5' and  Detail_Demande.NumOrdre = 1 
-- {?@IdAcademie} en rpt
 GO
group by  dbo.Lycee.IdLycee, dbo.Lycee.NomLycee, dbo.Lycee.Ville, dbo.Lycee.IdAcademie
order by count(Lycee.IdLycee)

GO
-- 6 Créer un état qui permet d'afficher pour une demande ....
select * from Professeur P where P.IdProfesseur = (select D.IdProfesseur from dbo.Demande D
where D.IdDemande = '1' -- {?@IdDemande} en crpt
)
GO
SELECT    distinct dbo.Lycee.IdLycee, dbo.Lycee.NomLycee, dbo.Lycee.Ville, dbo.Lycee.IdAcademie, dbo.Detail_Demande.NumOrdre
FROM         dbo.Lycee INNER JOIN
                      dbo.Detail_Demande ON dbo.Lycee.IdLycee = dbo.Detail_Demande.IdLycee INNER JOIN
                      dbo.Demande ON dbo.Detail_Demande.IdDemande = dbo.Demande.IdDemande
where  dbo.Detail_Demande.IdDemande = '1' --{?@IdDemande} en crpt
ORDER BY dbo.Detail_Demande.NumOrdre 
Go
-- 7 --Créer un état graphique de type histogramme qui représente ....
SELECT distinct  dbo.Lycee.IdAcademie, count(dbo.Detail_Demande.IdDemande) as 'Total Demande'
FROM         dbo.Lycee INNER JOIN
                      dbo.Detail_Demande ON dbo.Lycee.IdLycee = dbo.Detail_Demande.IdLycee
					  group by  dbo.Lycee.IdAcademie


-- Dossier 3 ----- 
-- 5 
	-- A ) La page affiche les détails de la dernière demande dans une grille ... 
				SELECT     dbo.Lycee.Ville, dbo.Lycee.NomLycee, dbo.Detail_Demande.IdDemande, dbo.Detail_Demande.IdLycee, dbo.Detail_Demande.NumOrdre
FROM         dbo.Detail_Demande INNER JOIN
                      dbo.Lycee ON dbo.Detail_Demande.IdLycee = dbo.Lycee.IdLycee 
where Detail_Demande.IdDemande = (select Top 1 IdDemande from Demande where IdProfesseur ='1' order by DateDem desc)
order by Detail_Demande.NumOrdre

select dbo.Calculer_Points(1)
select count(*) from Demande where IdProfesseur = '1'

