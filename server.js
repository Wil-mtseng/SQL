const { Pool } = require('pg');
const pool = new Pool({
    user: "user",
    host: "localhost",
    database: "db",
    password: "pass",
    port: 5432
});

pool.connect()


const helloWorld = () => {
    pool.query(
        "SELECT $1::text as message", ["Hello world!"],
        (error, results) => {
            if (error) {
                throw error;
            }

            console.log(results.rows);
        }
    );
}

helloWorld();

const addNewVisitor = (name, dateOfVisit, timeOfVisit, assistant, comments) => {

    insert = 'INSERT INTO visitors(name, dateOfVisit, timeOfVisit, assistant, comments) VALUES($1, $2, $3, $4, $5)'
    values = [name, dateOfVisit, timeOfVisit, assistant, comments]

    pool.query(insert, values, (err, res) => {
        if (err) throw err;
        console.log(res.rows);

    });
};

addNewVisitor();




const listAllVisitor = (id, name) => {

    view = 'SELECT * FROM visitors WHERE id = 30  AND name = null'
    values[id, name]

    pool.query(view, (err, res) => {
        if (err) throw err;
        console.log(res.rows);

    });
};

listAllVisitor();



const viewVisitor = (id) => {

    view = 'SELECT * FROM visitors WHERE id = $1 '
    values = [id]

    pool.query(view, values, (err, res) => {
        if (err) throw err;
        console.log(res.rows);

    });
};

viewVisitor();




const deleteAVisitor = (id) => {

    remove = 'DELETE FROM visitors WHERE id = 2',

        pool.query(remove, (err, res) => {
            if (err) throw err;
            console.log(res.rows);

        });
};

deleteAVisitor();




const updateVisitor = (name, dateOfVisit, timeOfVisit, assistant, comments) => {

    update = 'UPDATE visitors SET name = $1, dateOfVisit = $2, timeOfVisit = $3, assistant = $4, comments = $5  WHERE id = 11',
        values = [name, dateOfVisit, timeOfVisit, assistant, comments]

    pool.query(update, values, (err, res) => {
        if (err) throw err;
        console.log(res.rows);

    });
};

updateVisitor();


// const deleteAllVisitors = () => {
//     remove = 'DELETE FROM visitors',

//         pool.query(remove, (err, res) => {
//             if (err) throw err;
//             console.log(res.rows);
//         });
// }

// deleteAllVisitors();

pool.end();