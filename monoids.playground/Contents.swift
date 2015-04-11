// Playground - noun: a place where people can play



import CoreImage
import UIKit

typealias Filter = CIImage -> CIImage

var image = CIImage(CGImage:UIImage(named: "BuenosAires.jpg")?.CGImage)


func blur10(image:CIImage) -> CIImage {
    let filter = CIFilter(name: "CIGaussianBlur", withInputParameters: [kCIInputRadiusKey: 10,
        kCIInputImageKey: image]);
    return filter.outputImage;
}

let blurredImage = blur10(image)

func sepia(image:CIImage) -> CIImage {
    let filter = CIFilter(name: "CISepiaTone", withInputParameters: [kCIInputIntensityKey: 0.8,
        kCIInputImageKey: image]);
    return filter.outputImage;
}

let sepiaImage = sepia(image)


infix operator >>> {associativity left}
func >>>(f1:Filter, f2:Filter) -> Filter {
    return {(x:CIImage) in f2(f1(x))}
}

let composedFilter = sepia >>> blur10

let composedImage = composedFilter(image)

