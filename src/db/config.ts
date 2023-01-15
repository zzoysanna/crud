import { Sequelize } from 'sequelize';
import { Error } from '../types';

const dbString = `${process.env.DB_USER}:${process.env.DB_PASSWORD}@${process.env.DB_HOST || 'localhost'}:${process.env.DB_PORT || 5432}` ?? 'db';
const sequelizeConnection = new Sequelize(`postgres://${dbString}/nodegmp`);


sequelizeConnection.authenticate()
  .then(() => console.log('DB connection has been established successfully'))
  .catch((error: Error) => {
    console.error('Unable to connect to the database:');
    console.error(error);
  });

export default sequelizeConnection;
