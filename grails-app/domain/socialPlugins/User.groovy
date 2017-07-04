package socialPlugins

class User {
    String emailId
    String fullName
    String userName
    String password
    String homePage
    static constraints = {
        homePage(url: true, unique: true)
        password(password:true, size: 5..15, nullable: false)
        userName(size: 5..15, unique: true)
        emailId(nullable: false, email: true, unique: true)
        fullName(nullable: false)
    }
}
