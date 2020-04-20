CREATE TRIGGER trAuditoria
ON practica
FOR INSERT,UPDATE,DELETE
AS
BEGIN
	DECLARE @event_type varchar(50) = 
    CASE WHEN EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted)
        THEN 'Update'
    WHEN EXISTS(SELECT * FROM inserted) 
        THEN 'Insert'
    WHEN EXISTS(SELECT * FROM deleted)
        THEN 'Delete'
    END
	INSERT INTO auditoria (fecha,tabla,id_afectado,tipo_accion,usuario)
	SELECT getdate(),'PruebaGit',id,@event_type,SYSTEM_USER
	FROM INSERTED
	UNION ALL
	SELECT getdate(),'PruebaGit',id,@event_type,SYSTEM_USER
	FROM DELETED
END