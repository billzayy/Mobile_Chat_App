function groupAPI(app, io, sql) {
    app.get('/api/group/get-all', (req, res) => {
        var idMember = req.query.id;
        sql.conSQL(`Select * from GroupChat Where (Select LOCATE('${idMember}',GroupChat.Id_Member) AS LOCATED)`, recordset => {
            try {
                res.status(200).send({
                    "message": "Success",
                    "data": recordset
                })
            } catch (error) {
                res.send({
                    "message": "Fail",
                    "data": "Fail to get all group"
                })
            }
        })
    })

    app.post('/api/group/create', (req, res) => { 
        var memberList = req.body.memberList;
        var groupType = req.body.groupType;
        var groupName = req.body.groupName;
        var pictures = req.body.pictures;
        sql.conSQL(`Insert into GroupChat(Id_Member, GroupType, GroupName, Pictures) Values ('${memberList}','${groupType}','${groupName}','${pictures}')`, recordset => {
            try {
                res.status(200).send({
                    "message": "Success",
                    "data": "Create Group Successful"
                })
            } catch (error) {
                res.send({
                    "message": "Fail",
                    "data":"Fail to create group"
                })
            }
        })
    })

    app.delete('/api/group/delete', (req, res) => {
        var idGroup = req.body.id;
        sql.conSQL(`DELETE FROM GroupChat WHERE Id_Group = ${idGroup}`, (recordset) => {
            try {
                res.status(200).send({
                    "message": "Success",
                    "data":"Delete Group Successful"
                });
            } catch (error) {
                res.send({
                    "message": "Fail",
                    "data":"Fail to delete group"
                })
            }
        })
    })

    app.get('/api/group/last-message', (req, res) => {
        var idUser = req.query.id;
        sql.conSQL(`Select Message.Messages from Message, GroupChat where Message.Id_Message = GroupChat.Last_Message AND Message.Sendby = ${idUser}`, (recordset) => {
            try {
                res.status(200).send({
                    "message": "Success",
                    "data": recordset
                })
            } catch (error) {
                res.send({
                    "message": "Failure",
                    "data":"Fail to get last message"
                })
            }
        })
    })
}

module.exports = groupAPI;