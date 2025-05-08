const fireAdmin = require("../firebase-config")



function getUserByEmail(email){
    const ref = fireAdmin.db.ref("/users")
    ref.once("value", function(snapshot) {
        console.log(snapshot.val());
    });
}

module.exports = getUserByEmail()