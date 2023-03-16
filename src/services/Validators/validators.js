
export const uuidFormatValidator = (id) => {
  
  const regexExp_valid_UUID = /^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$/gi;
  const isValid = regexExp_valid_UUID.test(id)

  return isValid
}