import { saveCompany, findOneCompany, findManyCompany, updateCompany, deleteCompany } from "../../services/company/CompanyServices.mjs";
import { uuidFormatValidator } from "../../services/Validators/validators.js";

export const createCompanyController = async (req, res) => {

  const { code, name, birth } = req.body

  if (code !== null && code !== undefined && name !== null && name !== undefined && birth !== null && birth !== undefined) {

    const company = {
      code: code,
      name: name,
      birth: birth
    }

    const data = await saveCompany(company);

    if (data !== undefined && data !== null) {
      res.status(201).json(data)
    }
    else {
      res.json({ "message": "problema ao salvar" })
    }
  }
  else {
    res.json({ "message": "Dados incompleto" })
  }

}

export const findOneCompanyController = async (req, res) => {

  const { id } = req.params

  if (uuidFormatValidator(id)) {
    const data = await findOneCompany(id);

    if (data !== undefined && data !== null) {
      res.status(200).json(data);
    }
    else {
      res.status(204).json({ "message": "Compannhia não encontrado" });
    }
  }
  else {
    res.status(400).json({ "message": "id invalido" });
  }

}


export const findManyCompanyController = async (req, res) => {

  const queryResult = await findManyCompany()

  if (queryResult !== null && queryResult !== undefined) {
    res.status(200).json(queryResult)
  }
  else {
    res.status(204).json({ "message": "nenhum dado encontrado" })
  }
}


export const updateCompanyController = async (req, res) => {

  const { id, code, name, birth } = req.body

  if (uuidFormatValidator(id)) {

    const company = {
      id: id,
      code: code,
      name: name,
      birth: birth
    }

    const data = await updateCompany(company)

    if (data !== undefined && data !== null) {
      res.status(202).json(data)
    }

    res.status(204).json({ "message": "atualização não foi concluida" })
  }
}

export const deleteCompanyController = async (req, res) => {

  const { id } = req.body

  if (uuidFormatValidator(id)) {

    const result = await deleteCompany(id);

    if (result !== null && result !== undefined) {
      res.status(200).res.json(result)
    }
    else {
      res.status(204).send("")
    }
  }
  else {
    res.status(200).send("")
  }
}

