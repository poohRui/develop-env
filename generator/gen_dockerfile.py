class Generator:
    def __init__(self, template=None, config=None):
        self.template = template
        self.config = config
        self.linux_type = None
        self.linux_version = None
        self.python_version = None
        self.cuda_version = None
        self.cudnn_version = None
        self.cmake_version = None
        self.gcc_version = None

    def parse(self):
        """ 
            Get configures from yaml
        """
        from yaml import safe_load
        with open(self.config, 'r') as stream:
            configures = safe_load(stream)
            for key, value in configures.items():
                setattr(self, key, value)

    def generate(self):
        """
            Generate Dockerfile using template
        """
        username, user_uid, user_gid = self.get_user()
        images = self.linux_type + ":" + self.linux_version 
        if self.cuda_version and self.cudnn_version:
            images = "nvidia/cuda:" + self.cuda_version + \
                        "-cudnn" + self.cudnn_version + \
                        "-devel-" + self.linux_type + \
                        self.linux_version 
        from jinja2 import Template
        with open(self.template, 'r') as stream:
            template = Template(stream.read())
            render_result = template.render(
                    python_version=self.python_version,
                    gcc_version=self.gcc_version,
                    cmake_version=self.cmake_version,
                    linux_type=self.linux_type,
                    images=images,
                    username=username,
                    user_uid=user_uid,
                    user_gid=user_gid)
            with open("Dockerfile", 'w') as out_stream:
                out_stream.write(render_result)

    def get_user(self):
        """
            Return current user message 
        """
        import getpass
        from pwd import getpwnam
        username = getpass.getuser()
        user_id = getpwnam(username).pw_uid
        user_gid = getpwnam(username).pw_gid
        return username, user_id, user_gid


gen = Generator(template="dockerfile.tpl", config="config.yaml")
gen.parse()
gen.generate()

