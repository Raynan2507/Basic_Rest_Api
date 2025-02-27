import { NextFunction, Request, Response } from "express";
import Joi from "joi";

//create a new rule
const createShecma = Joi.object({
    name: Joi.string().required(),
    stock: Joi.number().min(0).required(),
    price: Joi.number().min(1).required(),
    exp_date: Joi.date().required(),
    type: Joi.string().valid("Syrup", "Tablet", "Powder").required()
})

const createValidation = (req: Request, res: Response, next: NextFunction) => {
    const validate = createShecma.validate(req.body);
    if (validate.error) {
        return res.status(400).json(validate.error.details.map(item => item.message).join());
    }
    next();
}

//create a new change
const updateShecma = Joi.object({
    name: Joi.string().optional(),
    stock: Joi.number().min(0).optional(),
    price: Joi.number().min(1).optional(),
    exp_date: Joi.date().optional(),
    type: Joi.string().valid("Syrup", "Tablet", "Powder").optional()
})

const updateValidation = (req: Request, res: Response, next: NextFunction) => {
    const validate = updateShecma.validate(req.body);
    if (validate.error) {
        return res.status(400).json(validate.error.details.map(item => item.message).join());
    }
    next();
}
export { createValidation, updateValidation }