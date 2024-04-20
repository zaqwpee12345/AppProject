class Member {
    String? id;
    String? memFullname;
    String? memUsername;
    String? memPassword;
    String? memEmail;
    String? memAge;
    String? massage;

    Member({this.id, this.memFullname, this.memUsername, this.memPassword, this.memEmail, this.memAge, this.massage});

    Member.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        memFullname = json["memFullname"];
        memUsername = json["memUsername"];
        memPassword = json["memPassword"];
        memEmail = json["memEmail"];
        memAge = json["memAge"];
        massage = json["massage"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["memFullname"] = memFullname;
        _data["memUsername"] = memUsername;
        _data["memPassword"] = memPassword;
        _data["memEmail"] = memEmail;
        _data["memAge"] = memAge;
        _data["massage"] = massage;
        return _data;
    }
}