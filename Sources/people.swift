//
//  people.swift
//  Perfect-JSON-API
//
//  Created by Jonathan Guthrie on 2016-09-26.
//
//

import PerfectHTTP

public class PackageDetails {
	// Container for array of type Package
	var data = [Package]()

	// Populating with a mock data object
	init(){
		data = [
			Package(packageID: "ID001", from: "London", to: "Paris"),
			Package(packageID: "ID002", from: "London", to: "Chennai"),
			Package(packageID: "ID003", from: "London", to: "Bombay"),
			Package(packageID: "ID004", from: "London", to: "Watrap")
		]
	}

	// A simple JSON encoding function for listing data members.
	// Ordinarily in an API list directive, cursor commands would be included.
	public func list() -> String {
		return toString()
	}

	// Accepts the HTTPRequest object and adds a new Package from post params.
	public func add(_ request: HTTPRequest) -> String {
		let new = Package(
			packageID: request.param(name: "packageID")!,
			from: request.param(name: "from")!,
			to: request.param(name: "to")!
		)
		data.append(new)
		return toString()
	}

	// Accepts raw JSON string, to be converted to JSON and consumed.
	public func add(_ json: String) -> String {
		do {
			let incoming = try json.jsonDecode() as! [String: String]
			let new = Package(
				packageID: incoming["packageID"]!,
				from: incoming["from"]!,
				to: incoming["to"]!
			)
			data.append(new)
		} catch {
			return "ERROR"
		}
		return toString()
	}


	// Convenient encoding method that returns a string from JSON objects.
	private func toString() -> String {
		var out = [String]()

		for m in self.data {
			do {
				out.append(try m.jsonEncodedString())
			} catch {
				print(error)
			}
		}
		return "[\(out.joined(separator: ","))]"
	}
    func returnSingleData(ID: String) -> String{
        var out = ""
        
        for m in self.data{
            
            if m.packageID == ID{
                do {
                    out += (try m.jsonEncodedString())
                } catch {
                    print(error)
                }
            }
        }
         return "[\(out)]"
    }

}

