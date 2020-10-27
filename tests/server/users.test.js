process.env.TEST = true;

const supertest = require('supertest');
const app = require('../../server/server');
const agent = supertest.agent(app);

const pool = require('../../server/modules/pool');

describe('Updating a users lastname', () => {
    let user;
  
    beforeEach(async() => {
      // Clean up my user table
      await pool.query('DELETE FROM "user"')
  
      // SETUP: Register a new user
      let registerRes = await agent
        .post('/api/user/register')
        .send({
          username: 'coopTronix',
          password: '123456789',
        });
      expect(registerRes.statusCode).toBe(201);
        user = registerRes.body;
    //   expect(user.username).toBe('coopTronix');
  
      // SETUP: Login as our new user
      let loginRes = await agent
        .post('/api/user/login')
        .send({ username: 'coopTronix', password: '123456789' });
      expect(loginRes.statusCode).toBe(200);
    });
      test(`should update a users lastName`, async() => {
        //POST trip 
        // to update user table and user trip data
        let postResponse = await agent
          .post(`/api/trip`)
          .send({
            firstName: 'Cooper',
            lastName: 'Doten',
            email: 'cooper.doten@gmail.com',
            streetAddress: '1234 Street St.',
            city: 'Jacksonville',
            state: 'Florida',
            zipCode: '55430',
            stateParkId: '62',
            stateParkName: 'Tettegouche State Park',
            campSite: 'D',
            photo: 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00269.jpg',
            startDate: '10/24/2020',
            endDate: '10/27/2020'
          });
          expect(postResponse.statusCode).toBe(201);
          // Student cohort should be updated
          // and I should see that in the response body
        
        });
});
