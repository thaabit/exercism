class SpaceAge:
    def __init__(self, seconds):
        self.seconds = seconds

    def on_earth_full(self):
        return self.seconds / 86400 / 365.25

    def on_earth(self):
        return round(self.on_earth_full(), 2)

    def on_mercury(self):
        return round(self.on_earth_full() / .2408467, 2)

    def on_venus(self):
        return round(self.on_earth_full() / .61519726,  2)

    def on_mars(self):
        return round(self.on_earth_full() / 1.8808158, 2)

    def on_jupiter(self):
        return round(self.on_earth_full() / 11.862615, 2)

    def on_saturn(self):
        return round(self.on_earth_full() / 29.447498, 2)

    def on_uranus(self):
        return round(self.on_earth_full() / 84.016846, 2)

    def on_neptune(self):
        return round(self.on_earth_full() / 164.79132, 2)
