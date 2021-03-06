//
//  RequestParameter.swift
//  TauFoundation
//
//  Created by Tibor Bodecs on 2020. 10. 23..
//

public struct RequestParameter: UnsafeEntity, StringReturn {

    public var unsafeObjects: UnsafeObjects? = nil
    
    public static var callSignature: [CallParameter] { [.string(labeled: "parameter")] }

    public func evaluate(_ params: CallValues) -> TemplateData {
        guard let req = req else { return .error("Needs unsafe access to Request") }
        return .string(req.parameters.get(params[0].string!))
    }
}
