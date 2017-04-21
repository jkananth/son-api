//
//  person.swift
//  Perfect-JSON-API
//
//  Created by Jonathan Guthrie on 2016-09-26.
//
//
import PerfectLib

class Package : JSONConvertibleObject {

	static let registerName = "person"

	var packageID: String = ""
	var from: String = ""
	var to: String = ""

	var fullName: String {
		return "\(packageID) \(from)"
	}

	init(packageID: String, from: String, to: String) {
		self.packageID	= packageID
		self.from	= from
		self.to		= to
	}

	override public func setJSONValues(_ values: [String : Any]) {
		self.packageID		= getJSONValue(named: "packageID", from: values, defaultValue: "")
		self.from		= getJSONValue(named: "from", from: values, defaultValue: "")
		self.to			= getJSONValue(named: "to", from: values, defaultValue: "")
	}
	override public func getJSONValues() -> [String : Any] {
		return [
			"packageID":packageID,
			"from":from,
			"to":to
		]
	}

}
