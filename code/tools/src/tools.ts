import fs from 'fs';
import * as dotenv from 'dotenv';
import { Pool } from 'pg'
import cmd from 'node-cmd';

var pool = null;

async function init() {

    dotenv.config();

    console.log('Hello, TypeScript!');
//    fs.writeFileSync("env.json", JSON.stringify(process.env));


    const args = {
        user:     process.env.db_user,
        database: process.env.db_name,
        password: process.env.db_password,
        host:     process.env.db_host,
        port:     process.env.db_port,
        min:      1,
        max:      process.env.max_threads, // max number of clients in the pool
        connectionTimeoutMillis:  15000,
        idleTimeoutMillis:        30000
    };

    console.log(args);

    pool = new Pool( args );

    let sql = "SELECT * FROM users ORDER BY id";

    let res = await pool.query(sql, []);

    console.log("Ok!", sql, res);
}

new Promise(async function (resolve, reject) {
    await init();
});