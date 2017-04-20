+++
date = "2017-04-10T14:21:00-05:00"
title = "Architecture"
weight = 2
+++

This section details the architecture demonstrated in this reference field asset.

### Architecture Diagram

<div title="rendered dynamically" align="middle">
{{< mermaid >}}
graph LR
E["Enablement repo"]--content is parsed and visualized in--A
A["Course Gen App"]--generates-->B["coursegen.course"]
B--"Gradle Build"-->D["Asciidr Enablement Material"]
{{< /mermaid >}}
</div>

Because a physical build of the enablement content gets kicked off when a course gets generated, the user may have to wait a few seconds until the course is generated and served. Only one user should generate courses at a time as there may be race conditions.
