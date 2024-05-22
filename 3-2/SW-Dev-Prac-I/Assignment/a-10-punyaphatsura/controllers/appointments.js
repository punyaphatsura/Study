const Appointment = require("../models/Appointment");
const Hospital = require('../models/Hospital');
//@desc     Get all appointments
//route     GET /api/v1/appointments
//@access   Public
exports.getAppointments = async (req, res, next) => {
  let query;

  //   console.log("A", mongoose.Types.ObjectId("65f1e219c47e9a0f66b9c7b1"));

  //General users can see only their appointments
  if (req.user.role !== "admin") {
    query = Appointment.find({ user: req.user._id }).populate({
      path: "hospital",
      select: "name province tel",
    });
  } else {
    if (req.params.hospitalId) {
      console.log(req.params.hospitalId);
      query = Appointment.find({hospital: req.params.hospitalId}).populate({
        path: "hospital",
        select: "name province tel",
      });
      // console.log(query);
    } else {
      query = Appointment.find().populate({
        path: "hospital",
        select: "name province tel",
      });
    }
  }
  try {
    const appointments = await query;
    console.log(appointments);
    res.status(200).json({
      success: true,
      count: appointments.length,
      data: appointments,
    });
  } catch (err) {
    console.log(error);
    res.status(500).json({
      success: false,
      message: "Cannot find Appointment",
    });
  }
};

//@desc     Get single appointment
//@route    GET /api/v1/appointments/:id
//@access   Public
exports.getAppointment = async (req, res,next) => {
    try {
        const appointment = await Appointment.findById(req.params.id).populate({
            path: "hospital",
            select: "name description tel",
        });

        if (!appointment) {
            return res.status(404).json({ 
                success: false,
                message: `No appointment with the id ${req.params.id}`
            });
        }
        res.status(200).json({ 
            success: true, 
            data: appointment 
        });
    } catch(error){
        console.log(error);
        res.status(500).json({
            success: false,
            message: "Cannot find Appointment"
        });
    }
};

//@desc     Add appointment
//@route    POST /api/v1/hospitals/:hospitalId/appointment
//@access   Private
exports.addAppointment = async(req,res,next) => {
    try{
        req.body.hospital = req.params.hospitalId;

        const hospital = await Hospital.findById(req.params.hospitalId);

        if (!hospital) {
            return res.status(404).json({ 
                success: false,
                message: `No hospital with the id of ${req.params.hospitalId}`
            });
        }

        //add user Id to req.body
        req.body.user = req.user._id;

        //Check for existing appointment
        const existedAppointments = await Appointment.find({user: req.user.id});

        //If the user is not an admin, they can only create 3 appointment.
        if (existedAppointments.length >= 3 && req.user.role !== 'admin'){
            return res.status(400).json({ 
                success: false,
                message: `The user with ID ${req.user.id} has already made 3 appointments.`
            });
        }

        const appointment = await Appointment.create(req.body);
        return res.status(200).json({ 
            success: true, 
            data: appointment 
        });
    } catch(error){
        console.log(err)
        return res.status(500).json({
            success: false,
            message: "Cannot create Appointment"
        });
    }
}

//@desc     Update appointment
//@route    PUT api/appointments/:id
//@access   Private
exports.updateAppointment = async(req,res,next) => {
    try{
        let appointment = await Appointment.findById(req.params.id);

        if (!appointment) {
            return res.status(404).json({ 
                success: false,
                message: `No appointment with the id of ${req.params.id}`
            });
        }

        //Make sure user is the appointment owner
        if (appointment.user.toString() !== req.user.id && req.user.role !== 'admin') {
            return res.status(401).json({ 
                success: false,
                message: `User ${req.user.id} is not authorized to update this appointment.`
            });
        }
        appointment = await Appointment.findByIdAndUpdate(req.params.id, req.body, {
            new: true,
            runValidators: true, 
        });
        return res.status(200).json({ 
            success: true, 
            data: appointment 
        });
    } catch(error){
        console.log(err)
        return res.status(500).json({
            success: false,
            message: "Cannot update Appointment"
        });
    }
}

//@desc     Delete appointment 
//@route    Delete /api/v1/appointments/:id
//@access   Private
exports.deleteAppointment = async (req, res,next) => {
    try {
        const appointment = await Appointment.findById(req.params.id);

        if (!appointment) {
            return res.status(404).json({ 
                success: false,
                message: `No appointment with the id of ${req.params.id}`
            });
        }
        //Make sure user is the appointment owner
        if (appointment.user.toString()!== req.user.id && req.user.role!== 'admin') {
            return res.status(401).json({ 
                success: false,
                message: `User ${req.user.id} is not authorized to delete this appointment.`
            });
        }

        await appointment.deleteOne();
        return res.status(200).json({ 
            success: true, 
            data: {} 
        });
    } catch(error){
        console.log(err)
        return res.status(500).json({
            success: false,
            message: "Cannot delete Appointment"
        });
    }
};