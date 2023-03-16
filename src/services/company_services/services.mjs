import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export const saveCompany = async(company)=>{
    
    let queryResult;
    
    try{

        prisma.$connect()

        queryResult = await prisma.companies.create(
            {
                data:{
                    code: company.code,
                    name: company.name,
                    foundation_date: company.birth  
                }
            }
        )
    }
    catch(error){

    }
    finally{
        prisma.$disconnect()
        return queryResult;
    }
    
}

export const findOneCompany = async(id) => {
    
    let queryResult;

    try{
        queryResult = await prisma.companies.findUnique(
            {
                where: {
                    id: id
                }
            }
        )
    }catch(error){
        console.error()
    }
    finally{
        prisma.$disconnect()
        return queryResult;
    }

}

export const findManyCompany = async() => {
    
    let queryResult;
    
    try{

        prisma.$connect()
        
        queryResult = await prisma.companies.findMany(
            {
                include: {
                    branchs: true
                }
            }
        )
    }
    catch(error){

    }
    finally{
        prisma.$disconnect()
        return queryResult;
    }
}

export const updateCompany = async(id) => {
    
    let queryResult;

    try{
        
        prisma.$connect();

        queryResult = await prisma.companies.update({

        })
    }
    catch(error){

    }
    finally{
        prisma.$disconnect()
        return queryResult;
    }
}

export const deleteCompany = async(id) =>{
    let queryResult;

    try {
        prisma.$connect();

        queryResult = await prisma.companies.delete({
            where:{
                id: id
            }
        })
    } 
    catch (error) {
        
    }
    finally{
        prisma.$disconnect();
        return queryResult;
    }
}