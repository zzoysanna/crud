import winston from 'winston';

const logConfiguration = {
  transports: [
    new winston.transports.Console(),
    new winston.transports.File({
      filename: './logs/logs.txt',
    }),
    new winston.transports.File({
      level: 'error',
      filename: './logs/error-logs.txt',
    }),
  ],
  format: winston.format.combine(
    winston.format.timestamp({
      format: 'MMM-DD-YYYY HH:mm:ss',
    }),
    winston.format.printf((info) => `--- ${info.level} ---: ${[info.timestamp]}: ${info.message}`),
  ),
};

export const logger = winston.createLogger(logConfiguration);
export default logger;
