<link href="https://fonts.googleapis.com/css?family=EB+Garamond|Overlock&display=swap" rel="stylesheet">
<style>


    .flex-container{
        display: flex;
        flex-wrap: wrap;
        justify-content: space-evenly;
        padding: 0;
        max-height: 100vh;
    }
h1{
    font-family: 'Overlock', cursive;
}

    p{
        margin-bottom:0 !important;
        position: relative;
    }
    .flex-container > * {
        list-style: none;
        flex: 0% !important;
        margin:0 !important;
        max-height: 100vh;
    }
    .p{

        flex-wrap: wrap;
        justify-content: space-between;
        padding-left: 0;
    }

    .p > * {
        list-style: none;
        flex: 0 0 33% !important;
        max-height: 74.5vh;
        overflow: auto;
    }

    #item{
        padding:0 !important;
        position:relative;
        font-family: 'EB Garamond', serif;
    }
</style>