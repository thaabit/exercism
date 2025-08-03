class SpaceAge {
    var planets : [String:Double] = [
        "Mercury": 0.2408467,
        "Venus":   0.61519726,
        "Earth":   1.0,
        "Mars":    1.8808158,
        "Jupiter": 11.862615,
        "Saturn":  29.447498,
        "Uranus":  84.016846,
        "Neptune": 164.79132,
    ]
    var earthYears : Double = 0.0
    var SECS_PER_YEAR = 60 * 60 * 24 * 365.25

    init(_ secs: Int) { earthYears = Double(secs) / SECS_PER_YEAR }

    lazy var onMercury = { earthYears / planets["Mercury"]! }()
    lazy var onVenus   = { earthYears / planets["Venus"]!   }()
    lazy var onEarth   = { earthYears / planets["Earth"]!   }()
    lazy var onMars    = { earthYears / planets["Mars"]!    }()
    lazy var onJupiter = { earthYears / planets["Jupiter"]! }()
    lazy var onSaturn  = { earthYears / planets["Saturn"]!  }()
    lazy var onUranus  = { earthYears / planets["Uranus"]!  }()
    lazy var onNeptune = { earthYears / planets["Neptune"]! }()

}
