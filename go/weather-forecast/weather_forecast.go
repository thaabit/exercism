// Package weather provides forecast information.
package weather

var (
	// CurrentCondition stores the current weather condition.
	CurrentCondition string
	// CurrentLocation stores the location of the weather.
	CurrentLocation string
)

// Forecast sets the CurrentLocation and CurrentCondition and then returns a stringified forecast.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
