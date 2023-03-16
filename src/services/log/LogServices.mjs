import fs from 'node:fs'

export const companyControllerLog = async( request ) => {
    const log = {
        "url": request.url, 
        "date": new Date()
    }

    await fs.write("./src/services/log/logs/companyController.csv", JSON.stringify(log), (err)=>{
        if(err){
            throw err
        }

        console.log("saved")
    })
}

export const logErrors = async(err) => {

}