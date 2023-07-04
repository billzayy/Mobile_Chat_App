function groupAPI(app, io, sql) {
    app.get('/api/group/get-all', (req, res) => {
        var idMember = req.query.idMember;
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
        var idMember = req.body.idMember;
        var groupType = req.body.groupType;
        var groupName = req.body.groupName;
        var pictures = req.body.pictures;
        sql.conSQL(`Insert into GroupChat(Id_Member, GroupType, GroupName, Pictures) Values ('${memberList}','${groupType}','${groupName}','${pictures}')`, recordset => {
            try {
                sql.conSQL(`Select * from GroupChat Where (Select LOCATE('${idMember}',GroupChat.Id_Member) AS LOCATED)`, recordset => {
                    try {
                        res.status(200).send({
                            "message": "Success",
                            "data": recordset[recordset.length - 1]
                        })
                    } catch (error) {
                        res.send({
                            "message": "Fail",
                            "data": "Fail to create group"
                        })
                    }
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
        var idGroup = req.body.idGroup;
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

    app.put('/api/group/update', (req, res) => {
        var idGroup = req.body.idGroup;
        var memberList = req.body.memberList;
        var groupType = req.body.groupType;
        var groupName = req.body.groupName;
        var picture = req.body.picture;
        sql.conSQL(`UPDATE GroupChat SET Id_Member = '${memberList}', GroupType = '${groupType}', GroupName = '${groupName}', Pictures = '${picture}' WHERE Id_Group = ${idGroup}`, (recordset) => {
            try {
                res.status(200).send({
                    "message": "Success",
                    "data": "Update successful !"
                })
            } catch (error) {
                res.send({
                    "message": "Failure",
                    "data": "Fail to update"
                })
            }
        })
    })
}

module.exports = groupAPI;