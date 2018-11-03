
import Foundation
import ObjectMapper

struct Collection : Mappable {
	var collection_id : Int?
	var res_count : Int?
	var image_url : String?
	var url : String?
	var title : String?
	var description : String?
	var share_url : String?

     init?(map: Map) {

	}

	 mutating func mapping(map: Map) {

		collection_id <- map["collection_id"]
		res_count <- map["res_count"]
		image_url <- map["image_url"]
		url <- map["url"]
		title <- map["title"]
		description <- map["description"]
		share_url <- map["share_url"]
	}

}
