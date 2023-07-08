<template>
  <div class="admin-container">
    <div class="admin-form-container">
      <form id="adminForm" @submit="handleSubmit" novalidate autocomplete="off">
        <h3>ADMIN</h3>

        <div class="form-group">
          <input type="email" id="uEmail" name="uEmail" class="form-control" placeholder="enter your email"
                 v-model="adminObj.email"/>
        </div>

        <div v-if="errors.length" class="error-box">
          <ul>
            <li v-for="error in errors" :key="error">{{ error }}</li>
          </ul>
        </div>

        <div class="form-group">
          <input type="password" id="uPass" name="uPass" class="form-control"
                 placeholder="enter admin password" v-model="adminObj.pass"/>
        </div>

        <div class="form-group">
          <input type="submit" value="admin access" class="btn">
        </div>
      </form>
    </div>
  </div>
</template>


<script>
// import {mapMutations} from "vuex";
import firebase from 'firebase/compat/app';
import 'firebase/compat/auth';
import 'firebase/compat/firestore';
import router from "@/router";

// const auth = useFirebaseAuth()

export default {
  name: 'Admin',

  data() {
    return {
      adminObj: {email: "", pass: ""},
      matchUser: undefined,
      errors: [],
    }
  },

  methods: {
    // ...mapMutations(["setAdmin"]),

    // async getMatchUser(email) {
    //   let data = await axios.get('/admin/' + email);
    //   this.matchUser = data.data;
    // },

    async login() {
      try {

        let data = {
          email: this.adminObj.email,
          password: this.adminObj.pass
        };
        await firebase
            .auth()
            .signInWithEmailAndPassword(data.email, data.password) // THIS LINE CHANGED
            .then((data) => {
              this.matchUser = data
            })
            .catch(error => {
              console.log(error.code)
              alert(error.message);
            });
      } catch (error) {
        console.error('Error during login:', error);
        // Handle login errors
        this.matchUser = undefined;
      }
    },

    async handleSubmit(e) {
      this.errors = [];
      if (!this.adminObj.email) {
        this.errors.push('Email is required');
      }

      if (!this.adminObj.pass) {
        this.errors.push('Password is required');
      }

      if (!this.errors.length == 0) {
        e.preventDefault();
      } else {
        e.preventDefault();
        await this.login();
        if (!this.matchUser) {
          this.errors.push("Admin password wrong!")
        } else {
          this.matchUser.user_password = "";
          // this.setUser(this.matchUser);
          await router.push("/admin/dashboard");
        }

      }
    }
  }
}
</script>

<style scoped>
.admin-container {
  padding: 2rem 9%;
}

.admin-container .admin-form-container {
  background-color: #fff;
  height: 100vh;
}

.admin-container .admin-form-container form {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  max-width: 40rem;
  width: 100%;
  box-shadow: 0 1rem 1rem rgba(0, 0, 0, 0.05);
  border: 0.1rem solid rgba(0, 0, 0, 0.2);
  padding: 2rem;
  border-radius: .5rem;
  animation: fadeUp .4s linear;
}

.admin-container .admin-form-container form h3 {
  padding-bottom: 1rem;
  font-size: 2rem;
  font-weight: bolder;
  text-transform: uppercase;
  color: #130f40;
  margin: 0;
}

.admin-container .admin-form-container form .form-control {
  margin: .7rem 0;
  border-radius: .5rem;
  background: #f7f7f7;
  padding: 2rem 1.2rem;
  font-size: 1.6rem;
  color: #130f40;
  text-transform: none;
  width: 100%;
  border: none;
}

.admin-container .admin-form-container form .btn {
  margin-bottom: 1rem;
  margin-top: 1rem;
  width: 100%;
}

.admin-container .admin-form-container form p {
  padding-top: 1rem;
  font-size: 1.5rem;
  color: #666;
  margin: 0;
}

.admin-container .admin-form-container form p a {
  color: #27ae60;
}

.admin-container .admin-form-container form p a:hover {
  color: #130f40;
  text-decoration: underline;
}

.admin-container .admin-form-container form .error-box {
  background-color: #fff9fa;
  box-sizing: border-box;
  border: 2px solid rgba(255, 66, 79, .2);
  border-radius: 2px;
  font-size: 12px;
  margin-bottom: 20px;
}

.admin-container .admin-form-container form .error-box ul {
  list-style-type: none;
  margin: 0;
  padding: 10px 0px;
}

.admin-container .admin-form-container form .error-box ul li {
  padding-left: 10px;
  color: rgb(182, 0, 0);
}
</style>