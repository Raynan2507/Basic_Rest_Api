import  Express  from "express";
import MedicineRoute from "./router/medicineRouter";

const app = Express ()

app.use(Express.json())
app.use('/drugstore',MedicineRoute)

const Port = 1975
app.listen(Port, () => {
    console.log(`Server drugstore running on port ${Port}`)
})