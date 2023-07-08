import {createStore} from "vuex"
import {AxiosService} from "@/services/axios.service";

const store = createStore({
    state() {
        return {
            allFoods: [],
            user: undefined,
            admin: undefined,
        }
    },
    mutations: {
        setFoodsData(state, payload){
            state.allFoods = payload;
        },
        setUser(state, payload){
            state.user = payload;
        }
        // setAdmin(state, payload){
        //     state.admin = payload;
        // }
    },
    actions: {
        async getFoodsData(context){
            await AxiosService.get('/foods')
            .then(function (response) {
                context.commit("setFoodsData", response.data);
            })
            .catch(function (error) {
                console.log(error);
            });
        },
    }
})

export default store;