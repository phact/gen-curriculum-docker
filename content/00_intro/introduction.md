+++
date = "2017-04-10T14:21:00-05:00"
title = "Introduction"
weight = 1
+++

This is a guide for how to use the power tools course generation / enablement asset brought to you by the Vanguard team.

### Motivation

Workshops sometimes require enablement materials to close a narrow customer skils gap that is required in order to proove out a certain bit of DSE Technology. Gathering the relevant material for this effort can be time consuming given that our enablement material is deep and extensive. This asset aims to make it easy for an SE to visualize the extent of the available enablement (put together by the amazing DataStax Academy team), navigate the enablement graph to the areas that the workshop will focus on, and select just the vertices that will be relevant for said workshop.

For example, in order to successfully prove out DSE Analytics Sql capabilities for a batch job in a workshop, the customer must have some general understanding of how Spark works. They may also need a basic understanding of the SparkSQL / DataFrames API. An SE can select the relevant course work from the skills graph visualization in the asset and generate a custom course that can be used in the introductory part of the workshop to ensure a certain level of understanding before the hands on execution begins.

### What is included?

This field asset includes a web application

* Machine Learning
* Streaming analytics
* Batch analytics
* Real-time JDBC / SQL (dynamic caching)
* DSEFS

### Business Take Aways

These custom courses are not meant to replace training or services. They are very narrow / very specific enablement given by an SE to simplify the delivery of a particular workshop required to give a customer confidence enough in DSE to take the next step. Training in the form of DataStax academy online training and Professional Services are both still relevant and critical for customer success.

### Technical Take Aways

The DataStax enablement team leverages a custom open source Gradle plugin and ascii doctor to generate enablement materials. This asset is a front end webapp that 1) generates a dynamic visualization of the available enablement material and 2) kicks off a custom build based on the selected material in the UI creating and serving the custom corse. The course itself is available via a web browser.
