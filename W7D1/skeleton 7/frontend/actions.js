const selectLocation = (city, jobs) => {
  return {
    type: "SWTICH_LOCATION",
    city,
    jobs,
  }
}
export default selectLocation
