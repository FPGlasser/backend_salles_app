import express, { Request, Response, NextFunction } from "express";

const App = express()


App.get("/", (req: Request, res: Response, next: NextFunction)=>{
    res.send("hello world")
})

App.listen(5000, "localhost", () => {

    console.log("server is running")
})