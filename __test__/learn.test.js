const sum = async (a, b) => {
  if (typeof (a) === 'number' && typeof (b) === 'number') {
    return a + b;
  }

  throw new Error('Error');
}

describe('teste de codigo assincrono', () => {
  test('teste com async/await', async () => {
    const result = await sum(3, 4)
    expect(result).toBeDefined()
    expect(result).toStrictEqual(7)
  })

  test('testando com then/catch', () => {
    return sum(3, 'ola').then((result) => {
      expect(result).toStrictEqual(7)
    }).catch((error) => {
      expect(error).toThrow('Error')
    })
  })
})