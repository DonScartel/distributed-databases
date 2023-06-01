// server.js

const express = require('express');
const cors = require('cors');
const { Pool } = require('pg');


// Create a new Express application
const app = express();

// Enable Cross-Origin Resource Sharing (CORS)
app.use(cors());


// Create a PostgreSQL connection pool
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'postgres',
    password: 'techwitz',
    port: 5432, // default: 5432
});

const getClient = () => {
    return new Promise(function(resolve, reject) {
        pool.query('SELECT * FROM client', (error, results) => {
            if (error) {
                reject(error)
            }
            resolve(results.rows);
        })
    })
}

const updateClient = (body) => {
    return new Promise(function(resolve, reject) {
        const { client_id, client_fname, client_lname } = body;
        const parsed_client_id = parseInt(client_id);
        console.log('before query');
        pool.query('UPDATE client SET client_fname = $2, client_lname = $3  WHERE client_id = $1', [client_fname, client_lname, parsed_client_id], (error, results) => {
            if (error) {
                console.log('error block');
                reject(error);
            } else {
                console.log('success');
                resolve(results);
            }
        });
    });
};


const createClient = (body) => {
    return new Promise(function(resolve, reject) {
        const { client_id, client_fname, client_lname, client_address, client_contact, client_addressregion, admin_id, branch_code } = body;
        pool.query('INSERT INTO client (client_id,client_fname,client_lname,client_address,client_contact,client_addressregion,admin_id,branch_code) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)', [client_id, client_fname, client_lname, client_address, client_contact, client_addressregion, admin_id, branch_code], (error, results) => {
            if (error) {
                reject(error)
            }

        })
    })
}

const deleteClient = (client_id) => {
    return new Promise(function(resolve, reject) {
        const parsed_client_id = parseInt(client_id);
        pool.query('DELETE FROM client WHERE client_id = $1', [parsed_client_id], (error, results) => {
            if (error) {
                reject(error);
            }
            resolve(`Client with deleted with ID: ${parsed_client_id}`);
        });
    });
};


module.exports = {
    getClient,
    createClient,
    deleteClient,
    updateClient,
}



app.use(express.json())
app.use(function(req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET,POST,PUT,DELETE,OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Access-Control-Allow-Headers');
    next();
});

app.get('/', (req, res) => {
    getClient()
        .then(response => {
            res.status(200).send(response);
        })
        .catch(error => {
            res.status(500).send(error);
        })
})

app.post('/client', (req, res) => {
    createClient(req.body)
        .then(response => {
            res.status(200).send(response);
        })
        .catch(error => {
            res.status(500).send(error);
        })
})

app.delete('/:client_id', (req, res) => {
    deleteClient(req.params.client_id)
        .then(response => {
            res.status(200).send(response);
        })
        .catch(error => {
            res.status(500).send(error);
        });
})

app.put('/:client_id', (req, res) => {
    // const clientId = req.params.client_id;
    const body = req.body;
    updateClient({ client_fname: body.client_fname, client_lname: body.client_lname })
        .then(response => {
            res.status(200).send(response);
        })
        .catch(error => {
            res.status(500).send(error);
        });
});


app.listen(8006, () => {
    console.log('Server listening on port 8006');
})