module.exports = {
    profiler: (request, response) => {
        return {
            "url": request.originalUrl,
            "method": request.method,
            "memory": `${Math.round(process.memoryUsage().heapUsed / (1024**2)).toFixed(2)} MB`,
        }
    }
}