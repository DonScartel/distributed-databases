import React, { useEffect, useState } from 'react';
import './style1.css';

function App() {
    const [client, setClient] = useState(false);

    useEffect(() => {
        getClient();
    }, []);

    function getClient() {
        fetch('http://localhost:8006/')
            .then(response => {
                return response.text();
            })
            .then(data => {
                setClient(data);
            });
    }

    function getClients() {
      fetch('http://localhost:8006/')
        .then(response => response.text())
        .then(data => {
          const jsonData = JSON.parse(data);
          console.log(jsonData);
          const clientsList = document.getElementById('clients-list');
          clientsList.innerHTML = '';
          jsonData.forEach(client => {
            const li = document.createElement('li');
            li.textContent = `${client.client_id}, ${client.client_fname}, ${client.client_lname}, ${client.client_address}, ${client.client_contact}, ${client.client_addressregion}, ${client.admin_id}, ${client.branch_code}`;
            clientsList.appendChild(li);
          });
        })
        .catch(error => {
          console.error('Error fetching districts:', error);
        });
    }
    

    function createClient() {
        let client_id = prompt('Enter client id');
        let client_fname = prompt('Enter client first name');
        let client_lname = prompt('Enter client last name');
        let client_address = prompt('Enter client address');
        let client_contact = prompt('Enter client contact');
        let client_addressregion = prompt('Enter client address region');
        let admin_id = prompt('Enter admin id');
        let branch_code = prompt('Enter corresponding branch code');

        fetch('http://localhost:8006/client', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({client_id, client_fname, client_lname, client_address, client_contact, client_addressregion, admin_id, branch_code}),
        })
            .then(response => {
                return response.text();
            })
            .then(data => {
                alert(data);
                getClient();
            });
    }

    function deleteClient() {
        let client_id = prompt('Enter client id');
        fetch(`http://localhost:8006/${client_id}`, {
            method: 'DELETE',
        })
            .then(response => {
                if (response.ok) {
                    return response.text();
                } else {
                    throw new Error('Failed to delete district');
                }
            })
            .then(data => {
                alert(data);
                getClient();
            })
            .catch(error => {
                console.error(error);
            });
    }

    function updateClient() {
      let client_id = prompt('Enter client id');
      let client_fname = prompt('Enter client first name');
      let client_lname = prompt('Enter client last name');
      // let client_address = prompt('Enter client address');
      // let client_contact = prompt('Enter client contact');
      // let client_addressregion = prompt('Enter client address region');
      // let admin_id = prompt('Enter admin id');
      // let branch_code = prompt('Enter corresponding branch code');
    
      fetch(`http://localhost:8006/${client_id}`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({client_fname: client_fname, client_lname: client_lname})
      })
        .then(response => {
          if (response.ok) {
            return response.text();
          } else {
            throw new Error('Failed to update district');
          }
        })
        .then(data => {
          alert(data);
          getClient();
        })
        .catch(error => {
          console.error(error);
        });
    }
    
    return (
        <div>
            
            {/* {client ? client : 'it does not work '} */}

            <h1>TECHWITZ SAVINGS AND CREDIT</h1>
            

            <br />
            <section>
            <button onClick={createClient}>Add client</button>
            <br />
            <button onClick={deleteClient}>Delete client</button>
            <br />
            <button onClick={updateClient}>update client</button>
            <br />
            
            <button onClick={getClients}>Get Clients</button>
            <ul id="clients-list"></ul>
            </section>
        </div>
    );
}

export default App;