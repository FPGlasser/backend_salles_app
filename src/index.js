import express from 'express'
import { middleware } from './middleware/middleware.mjs';
import companiesRouter from './routes/companiesRoutes.mjs';

const App = express()

middleware(express, App);

App.use('/company', companiesRouter);
App.use('/branch', branchRouter);
App.use('/product', productRouter);
App.use('/employee', employeeRouter);
App.use('/sales', salesRouter);
App.use('/login', loginRouter);


App.listen(5000, () => {
  console.log("app is running")
});

process.on('uncaughtException', (error) => {
  console.error(error)
}).on('uncaughtExceptionMonitor', (error) => {
  console.error(error)
})
