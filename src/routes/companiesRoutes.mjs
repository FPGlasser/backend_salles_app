import express from 'express'
import { createCompany,   } from '../controllers/CompanyController.mjs'

const companiesRouter = express.Router()

companiesRouter.post('/save', createCompany)

companiesRouter.get('/:id', (req, res)=>{})//one

companiesRouter.get('/', (req, res)=>{})//many

companiesRouter.get('/update', (req, res)=>{})

companiesRouter.get('/delete/:id', (req, res)=>{})

export default companiesRouter;