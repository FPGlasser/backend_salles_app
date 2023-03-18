
//MATCHERS VERDADES E NÃO VERDADES EXPECT().MACHER() OU EXPECT().NOT.MATCHER()
const sum = (a, b) => {
  if (typeof (a) === "number" && typeof (b) === "number") {
    return a + b
  }

  throw new Error('the type is not valid')
}

describe('teste com machers verdades', () => {
  test('checar a soma de 2 valores', () => {
    expect(() => sum(2, '')).toThrow(/^the type is not valid$/)
  })
})