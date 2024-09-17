import { Router } from "express";
import { createMedicine, deleteMedicine, readMedicine, updateMedicine } from "../controller/medicineController";
import { createValidation, updateValidation } from "../middleware/medicineValidation";
const router = Router();

//route for add new medicine

router.post("/medicine", createValidation, createMedicine)

// route to show all medicine
router.get("/", readMedicine)

//route to update medicine
router.put(`/:id`,[updateValidation], updateMedicine)

//route for delete medicine
router.delete(`/:id`, deleteMedicine)

export default router