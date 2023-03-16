

export const middleware = (express, app)=>{
    app.use(express.json())
    app.use(express.urlencoded({extended: true}))
}