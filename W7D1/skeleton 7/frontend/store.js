import { createStore } from 'redux'
import reducer from 'frontend/reducer.js'

const store = createStore(reducer)

export default store;
