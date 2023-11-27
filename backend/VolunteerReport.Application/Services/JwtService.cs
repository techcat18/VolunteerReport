using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Common.Options;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.Services;

public class JwtService: IJwtService
{
    private readonly JwtOptions _jwtOptions;

    public JwtService(
        IOptions<JwtOptions> jwtOptions)
    {
        _jwtOptions = jwtOptions.Value;
    }

    public Task<string> GenerateTokenAsync(User userEntity)
    {
        var claims = new List<Claim>
        {
            new(ClaimTypes.NameIdentifier, userEntity.Id.ToString()),
            new(ClaimTypes.Name, userEntity.UserName)
        };

        //TODO: Add permission claims

        return Task.FromResult(GenerateToken(claims));
    }
    
    #region Private methods

    private string GenerateToken(IEnumerable<Claim> claims)
    {
        var tokenHandler = new JwtSecurityTokenHandler();
        
        var key = Encoding.ASCII.GetBytes(_jwtOptions.Secret);
        
        var tokenDescriptor = new SecurityTokenDescriptor
        {
            Subject = new ClaimsIdentity(claims),
            Expires = DateTime.UtcNow.AddMinutes(30),
            SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
        };
        
        var token = tokenHandler.CreateToken(tokenDescriptor);
        return tokenHandler.WriteToken(token);
    }

    #endregion
}