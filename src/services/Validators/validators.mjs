
export const uuidFormatValidator = (id) => {

  const uuidRegex = /^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$/gi;
  const isValid = uuidRegex.test(id);

  return isValid;
}

export const emailValidator = (email) => {

  const emailRegex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/gi;
  const isValid = emailRegex.test(email)

  return isValid;
}