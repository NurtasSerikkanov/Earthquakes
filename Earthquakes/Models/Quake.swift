import Foundation

struct Quake {
    let magnitude: Double
    let tsunami: Int
    let place: String
    let time: Date
    let code: String
    let detail: URL
    var location: QuakeLocation?
}

extension Quake: Identifiable {
    var id: String { code }
}

extension Quake: Decodable {
    private enum CodingKeys: String, CodingKey {
        case magnitue = "mag"
        case tsunami
        case place
        case time
        case code
        case detail
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawMaginute = try? values.decode(Double.self, forKey: .magnitue)
        let rawTsunami = try? values.decode(Int.self, forKey: .tsunami)
        let rawPlace = try? values.decode(String.self, forKey: .place)
        let rawTime = try? values.decode(Date.self, forKey: .time)
        let rawCode = try? values.decode(String.self, forKey: .code)
        let rawDetail = try? values.decode(URL.self, forKey: .detail)
        
        guard let magnitude = rawMaginute,
              let tsunami = rawTsunami,
              let place = rawPlace,
              let time = rawTime,
              let code = rawCode,
              let detail = rawDetail
        else {
            throw QuakeError.missingData
        }
        
        self.magnitude = magnitude
        self.tsunami = tsunami
        self.place = place
        self.time = time
        self.code = code
        self.detail = detail
    }
}
