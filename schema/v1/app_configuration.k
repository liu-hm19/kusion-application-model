import schema.v1.workload as wl
import schema.v1.trait as t
import schema.v1.monitoring as m
import schema.v1.accessories.mysql
import schema.v1.accessories.postgres

schema AppConfiguration:
    """ AppConfiguration is a developer-centric definition that describes how to run an Application.
    This application model builds upon a decade of experience at AntGroup running super large scale
    internal developer platform, combined with best-of-breed ideas and practices from the community.

    Attributes
    ----------
    workload: wl.Service | wl.Job, default is Undefined, required.
        Workload defines how to run your application code. Currently supported workload profile
        includes Service and Job.
    accessories: {str:any}, default is Undefined, optional.
        Accessories defines a collection of accessories that will be attached to the workload.
    labels: {str:str}, default is Undefined, optional.
        Labels can be used to attach arbitrary metadata as key-value pairs to resources.
    annotations: {str:str}, default is Undefined, optional.
        Annotations are key/value pairs that attach arbitrary non-identifying metadata to resources.

    Examples
    --------
    # Instantiate an App with a long-running service and its image is "nginx:v1"

    import catalog.models.schema.v1 as ac
    import catalog.models.schema.v1.workload as wl
    import catalog.models.schema.v1.workload.container as c

    helloworld : ac.AppConfiguration {
        workload: wl.Service {
            containers: {
                "nginx": c.Container {
                    image: "nginx:v1"
                }
            }
        }
    }
    """

    # Workload defines how to run your application code.
    workload:                   wl.Service | wl.Job

    # Accessories defines a collection of accessories that will be attached to the workload.
    accessories:                {str:any}

    ###### Other metadata info
    # Labels and annotations can be used to attach arbitrary metadata as key-value pairs to resources.
    labels?:                    {str:str}
    annotations?:               {str:str}