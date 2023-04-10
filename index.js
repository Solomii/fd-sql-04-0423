const { Client } = require("pg");
const config = {
    host: "localhost",
    port: 5432,
    database: "fd_test",
    user: "postgres",
    password: "postgres",
};

const loadUsers = async () => {
    try {
        const res = await fetch(
            "https://randomuser.me/api/?results=100&seed=fdpg&nat=gb&page=9"
        );
        const data = await res.json();
        console.log(data.results)
        return data.results;
        
    } catch (error) {
        console.log(error);
    }
};

// loadUsers(10)

// const users = [
//     {
//         firstName: "Test1",
//         lastName: "Node1",
//         email: "node@gmail1.com",
//         isMail: false,
//         birthday: "1987-12-12",
//         height: 1.75,
//     },
//     {
//         firstName: "Test2",
//         lastName: "Node2",
//         email: "node@gmail2.com",
//         isMail: true,
//         birthday: "1987-12-12",
//         height: 1.75,
//     },
//     {
//         firstName: "Test3",
//         lastName: "Node3",
//         email: "node@gmail3.com",
//         isMail: true,
//         birthday: "1987-12-12",
//         height: 1.75,
//     },
// ];

// const mapUsers = (users) => {
//     return users
//         .map(
//             (user) =>
//                 `('${user.firstName}', '${user.lastName}', '${user.email}', '${user.isMail}', '${user.birthday}','${user.height}')`
//         )
//         .join(",");
// };
// console.log(mapUsers(users));

const mapUsers = (users) => {
  return users
      .map(
          ({name:{first, last}, email, gender, dob:{date}}) =>
              `('${first}', '${last}', '${email}', '${gender==='male'}', '${date}','${(Math.random()+1.2).toFixed(2)}')`
      )
      .join(",");
};

const client = new Client(config);
start();

async function start() {
    try {
        await client.connect();
        const users = await loadUsers();
        const res = await client.query(
            `INSERT INTO "users"("firstName", "lastName", "email", "isMail", "birthday", "height") VALUES ${mapUsers(
                users
            )}`
        );
        console.log(res);
        await client.end();
    } catch (error) {
        console.log(error);
    }
}
