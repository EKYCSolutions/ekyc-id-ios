//
//  Localize.swift
//  EkycID
//
//  Created by keanghok on 16/11/22.
//

extension String {
    func localized(_ lang: String) -> String {
//    print(Bundle.main.resourceURL)
    let LocalizeBundleURL = Bundle(for: EkycID.self).url(forResource: "Localize", withExtension: "bundle")
    
 
    let LocalizeBundle = Bundle(url: LocalizeBundleURL!)
    let path = LocalizeBundle!.path(forResource: lang, ofType: "lproj")
    let bundle = Bundle(path: path!)

        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
