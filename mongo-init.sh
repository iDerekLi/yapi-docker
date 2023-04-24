docker exec -it yapi-mongodb /bin/mongosh

use admin
db.createUser({
    user: 'root',
    pwd: '123456',
    roles: [{ role: 'root', db: 'admin' }]
})
db.auth("root", "123456");

use yapi
db.createUser({
    user: 'yapi',
    pwd: 'yapi123456',
    roles: [
        { role: "dbAdmin", db: "yapi" },
        { role: "readWrite", db: "yapi" }
    ]
});
db.auth("yapi", "yapi123456");
