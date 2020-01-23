//
//  RQScannerViewController.swift
//  taskForMsApps
//
//  Created by damir hodez on 22/01/2020.
//  Copyright © 2020 damir hodez. All rights reserved.
//

import UIKit
import AVFoundation

class QRScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    // will display a video of what camera is capturing on screen
    var video: AVCaptureVideoPreviewLayer!
    // creating a Session
    var session: AVCaptureSession!
    // a delegate to notify changed
    var delegate: QRScannerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view loaded")
        initScanner()
    }
    
    func initScanner() {
        
        // defining the session
        session = AVCaptureSession()
        print("got into init")
        // define capture device
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        
        // creating the video input
        var videoInput: AVCaptureDeviceInput
        
        do {
            // providing media from the capturing device that we need to add to session
            videoInput = try AVCaptureDeviceInput(device: captureDevice)
        } catch {
            print("video error")
            return
        }
        
        if (session.canAddInput(videoInput)) {
            // add the video media to the session
            session.addInput(videoInput)
        } else {
            print("Faild inputting")
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        // checking if we can add the provided data
        if (session.canAddOutput(metadataOutput)) {
            // if we can it adds the data to the session
            session.addOutput(metadataOutput)
            
            // sending the delegate so we could use the captured data later
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            // specifing the code type we want to capture
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            print("faild outputting")
            return
        }
        
        // a video the use need displayed on screen while getting the code
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        video.videoGravity = .resizeAspectFill
        view.layer.addSublayer(video)
        
        // starting the session
        session.startRunning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view appeared")
        super.viewDidAppear(animated)
        if (session.isRunning == false) {
            // when we get to the scanner page we want it to run
            // if it didnt start by now, thet start it
            session.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // when we go back to table if the session is running we stopping it
        if (session.isRunning == true) {
            session.stopRunning()
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // after we capture a code we get the output as metadataObject
        // so we stop the session
        session.stopRunning()
        
        // and manipulating the object
        // we need the first object
        if let metadataObject = metadataObjects.first {
            // modifing the object to readable object
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            // and we getting the readable object as a string
            guard let stringValue = readableObject.stringValue else { return }
            // making a vibration after capturing the object
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            // take the string to add movie in data source
            MovieDataSource.shared.addMovie(from: stringValue)
            // starts the movieAdded in tableViewController
            delegate?.movieAdded()
        }
        // dismissing the page and getting back to the table
        navigationController?.popViewController(animated: true)
    }
    
    // we dont need status bar
    override var prefersStatusBarHidden: Bool { true }
    
    // we want it to be in portrait orientation screen mode
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { .portrait }

}

// scanner delegate
protocol QRScannerDelegate  {
    func movieAdded()
}
