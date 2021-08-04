SELECT * from Ens_Config.Production 

select * FROM Ens_Config.Item 


SELECT ID,Name,Description
FROM EnsLib_PubSub.DomainName
ORDER BY Name

SELECT * FROM  EnsLib_PubSub.Subscriber 

SELECT * FROM  EnsLib_PubSub.Subscription  

select a.DomainName ,a.Name ,a.Target, b.Topic,c.ClassName FROM  EnsLib_PubSub.Subscriber as a Left join EnsLib_PubSub.Subscription as b on a.ID = b.Subscriber inner join Ens_Config.Item as c on a.Target = c.Name where c.ClassName ='HCC.SVR.Prod.BO.StandardHCCOutBound'