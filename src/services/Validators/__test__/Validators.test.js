
describe('learning test', () => {
  const data = { one: 1 }
  data["two"] = { two: 2 }

  test('utilizando toEqual', () => {
    expect(data).toEqual({ one: 1, two: { two: 2 } })
  })

  test('utilizando toBe', () => {
    expect(data).toBe({ one: 1, two: { two: 2 } })
  })
})

